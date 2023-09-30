<template>
    <div class="container mt-3">
        <h2 class="text-center text-success">Lista de Proyectos</h2>
        <div class="row">
            <div class="col-md-12">
                <router-link to="/projects/create" class="btn btn-primary mb-3 col-md-2 ml-3">Crear Nuevo Proyecto</router-link>
                <div class="card shadow">
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Título</th>
                                    <th>Descripción</th>
                                    <th>Fecha de Inicio</th>
                                    <th>Fecha de Finalización</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="project in projects" :key="project.id">
                                    <td>{{ project.title }}</td>
                                    <td>{{ project.description }}</td>
                                    <td>{{ project.start_date }}</td>
                                    <td>{{ project.end_date }}</td>
                                    <td>
                                        <router-link :to="'/projects/' + project.id" class="btn btn-info btn-sm">
                                            Ver
                                        </router-link>
                                        <router-link :to="'/projects/edit/' + project.id" class="btn btn-primary btn-sm">
                                            Editar
                                        </router-link>
                                        <button class="btn btn-danger btn-sm"
                                            @click="showDeleteConfirmation(task.id)">Eliminar</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
            projects: [],
        };
    },
    created() {
        this.fetchProjects();
    },
    methods: {
        async fetchProjects() {
            try {
                const accessToken = localStorage.getItem("access_token");
                const response = await axios.get("http://localhost:8000/api/projects", {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                    },
                });

                this.projects = response.data.data;
            } catch (error) {
                console.error(error);
            }
        },
        showDeleteConfirmation(project) {
            if (confirm("¿Estás seguro de que deseas eliminar este proyecto?")) {
                this.deleteProject(project);
            }
        },
        async deleteProject(project) {
            try {
                const accessToken = localStorage.getItem("access_token");
                await axios.delete(`http://localhost:8000/api/projects/${project.id}`, {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                    },
                });

                console.log(`Proyecto ${project.id} eliminado con éxito`);
                this.fetchProjects();
            } catch (error) {
                console.error(error);
            }
        },
    },
};
</script>

<style>
.btn-link a {
  text-decoration: none;
  color: inherit;
}

.btn-link a:hover {
  text-decoration: underline;
  color: inherit;
}
</style>
