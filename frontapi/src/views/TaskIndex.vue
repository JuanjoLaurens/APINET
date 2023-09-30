<template>
    <div class="container mt-3">
        <h2 class="text-center text-success">Lista de Tareas</h2>
        <div class="row">
            <div class="col-md-12">
                <router-link to="/task/create" class="btn btn-primary mb-3 col-md-2 ml-3">Crear Nueva
                    Tarea</router-link>
                <div class="card shadow">
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Título</th>
                                    <th>Descripción</th>
                                    <th>Proyecto</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="task in tasks" :key="task.id">
                                    <td>{{ task.title }}</td>
                                    <td>{{ task.description }}</td>
                                    <td>{{ task.project ? task.project.title : 'N/A' }}</td>
                                    <td>{{ task.task_state ? task.task_state.name : 'Estado Desconocido' }}</td>
                                    <td>
                                        <router-link :to="'/task/' + task.id" class="btn btn-info btn-sm">
                                            Ver
                                        </router-link>
                                        <router-link :to="'/task/edit/' + task.id" class="btn btn-primary btn-sm">
                                            Editar
                                        </router-link>
                                        <button class="btn btn-danger btn-sm"
                                            @click="confirmDelete(task.id)">Eliminar</button>
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
            tasks: [],
        };
    },
    created() {
        this.fetchTasks();
    },
    methods: {
        async confirmDelete(taskId) {
            const confirmed = window.confirm('¿Estás seguro de que deseas eliminar esta tarea?');

            if (confirmed) {
                // Lógica para eliminar la tarea, por ejemplo, haciendo una solicitud HTTP DELETE
                try {
                    const accessToken = localStorage.getItem("access_token");
                    const response = await axios.delete(`http://localhost:8000/api/tasks/${taskId}`, {
                        headers: {
                            Authorization: `Bearer ${accessToken}`,
                        },
                    });

                    // Lógica para manejar la respuesta (redirección, mensaje de éxito, actualizar la lista, etc.)
                    console.log(response.data);

                    // Actualiza la lista de tareas si es necesario
                    this.fetchTasks();
                } catch (error) {
                    console.error(error);
                }
            }
        },
        async fetchTasks() {
            try {
                const accessToken = localStorage.getItem("access_token");
                const response = await axios.get("http://localhost:8000/api/tasks", {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                    },
                });

                this.tasks = response.data.data;
            } catch (error) {
                console.error(error);
            }
        },
    },

};
</script>
