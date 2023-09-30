<template>
    <div class="container mt-3">
      <h2 class="text-center text-success">Detalles de la Tarea</h2>
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card shadow">
            <div class="card-body">
              <h3>{{ task.title }}</h3>
              <p><strong>Descripción:</strong> {{ task.description }}</p>
              <p><strong>Proyecto:</strong> {{ task.project ? task.project.title : 'N/A' }}</p>
              <p><strong>Estado:</strong> {{ task.task_state ? task.task_state.name : 'Estado Desconocido' }}</p>
              <router-link to="/task" class="btn btn-primary">Volver</router-link>
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
        task: {},
      };
    },
    created() {
      const taskId = this.$route.params.id;
      this.fetchTask(taskId);
    },
    methods: {
      async fetchTask(id) {
        try {
          const accessToken = localStorage.getItem("access_token");
          const response = await axios.get(`http://localhost:8000/api/tasks/${id}`, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
            },
          });
          this.task = response.data.data;
        } catch (error) {
          console.error(error);
        }
      },
    },
  };
  </script>
  