<template>
    <div class="container mt-3">
        <h2 class="text-center  text-success ">Editar Proyecto</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <form @submit.prevent="updateProject">
                            <div class="mb-3">
                                <label for="title" class="form-label">Título del Proyecto</label>
                                <input type="text" class="form-control" id="title" v-model="project.title" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Descripción</label>
                                <textarea class="form-control" id="description" v-model="project.description" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="start_date" class="form-label">Fecha de Inicio</label>
                                <input type="date" class="form-control" id="start_date" v-model="project.start_date" required>
                            </div>
                            <div class="mb-3">
                                <label for="end_date" class="form-label">Fecha de Finalización</label>
                                <input type="date" class="form-control" id="end_date" v-model="project.end_date" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Asignar Usuarios</label>
                                <div class="user-checkboxes">
                                    <div v-for="user in availableUsers" :key="user.id">
                                        <input type="checkbox" :id="`user-${user.id}`" v-model="selectedUsers" :value="user.id">
                                        <label :for="`user-${user.id}`">{{ user.name }}</label>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Actualizar Proyecto</button>
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
        project: {},
        selectedUsers: [], // Usaremos esto para mantener los usuarios seleccionados
        availableUsers: [], // Usaremos esto para mostrar la lista de usuarios disponibles
      };
    },
    created() {
      const projectId = this.$route.params.id;
      this.fetchProject(projectId);
      this.fetchAvailableUsers(); // Cargar la lista de usuarios disponibles
    },
    methods: {
      async fetchProject(id) {
        try {
          const accessToken = localStorage.getItem("access_token");
          const response = await axios.get(`http://localhost:8000/api/projects/${id}`, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
            },
          });
  
          this.project = response.data.data;
          // Llena el array selectedUsers con los IDs de usuarios asignados al proyecto
          this.selectedUsers = this.project.users.map(user => user.id);
        } catch (error) {
          console.error(error);
        }
      },
      async fetchAvailableUsers() {
        try {
          const accessToken = localStorage.getItem("access_token");
          const response = await axios.get("http://localhost:8000/api/list", {
            headers: {
              Authorization: `Bearer ${accessToken}`,
            },
          });
  
          this.availableUsers = response.data.users;
        } catch (error) {
          console.error(error);
        }
      },
      // Resto de los métodos (addUser, updateProject) se mantienen igual que en la vista de creación
      // ...
    },
  };
  </script>
  