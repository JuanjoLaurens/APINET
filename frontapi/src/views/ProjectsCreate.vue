<template>
    <div class="container mt-3">
        <h2 class="text-center  text-success ">Crear Proyecto</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <form @submit.prevent="createProject">
                            <div class="mb-3">
                                <label for="title" class="form-label">Título del Proyecto</label>
                                <input type="text" class="form-control" id="title" v-model="project.title" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Descripción</label>
                                <textarea class="form-control" id="description" v-model="project.description"
                                    required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="start_date" class="form-label">Fecha de Inicio</label>
                                <input type="date" class="form-control" id="start_date" v-model="project.start_date"
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="end_date" class="form-label">Fecha de Finalización</label>
                                <input type="date" class="form-control" id="end_date" v-model="project.end_date" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Asignar Usuarios</label>
                                <div class="user-checkboxes">
                                    <div v-for="user in availableUsers" :key="user.id">
                                        <input type="checkbox" :id="`user-${user.id}`" v-model="selectedUsers"
                                            :value="user.id">
                                        <label :for="`user-${user.id}`">{{ user.name }}</label>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Crear Proyecto</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script>
import axios from "axios";

export default {
    data() {
        return {
            project: {
                title: "",
                description: "",
                start_date: "",
                end_date: "",
            },
            selectedUsers: [],
            availableUsers: [], // Lista de usuarios disponibles
        };
    },
    created() {
        this.fetchAvailableUsers(); // Obtener la lista de usuarios disponibles
    },
    methods: {
        async fetchAvailableUsers() {
            try {
                const response = await axios.get("http://localhost:8000/api/list");
                this.availableUsers = response.data.users;
            } catch (error) {
                console.error(error);
            }
        },
        async createProject() {
            try {
                const accessToken = localStorage.getItem("access_token"); // Obtiene el token del localStore
                const response = await axios.post("http://localhost:8000/api/projects", {
                    ...this.project,
                    user_ids: this.selectedUsers, // Agrega los IDs de usuarios seleccionados al proyecto
                }, {
                    headers: {
                        Authorization: `Bearer ${accessToken}`, // Incluye el token en el encabezado de autorización
                    },
                });

                // Lógica para manejar la respuesta (redirección, mensaje de éxito, limpiar formulario, etc.)
                console.log(response.data);

                // Redirigir a la lista de proyectos u otra vista según sea necesario
                this.$router.push("/projects");
            } catch (error) {
                console.error(error);
            }
        },
        addUser() {
            // Lógica para agregar usuarios al proyecto
        },
    },
};
</script>

<style>
.user-checkboxes {
  display: flex;
  flex-wrap: wrap;
  gap: 10px; /* Espacio entre los checkboxes */
}

.user-checkboxes input[type="checkbox"] {
  margin-right: 5px; /* Espacio entre los checkboxes individuales */
}
</style>