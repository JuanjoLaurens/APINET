<template>
  <div class="container mt-3">
    <h2 class="text-center text-success">Detalles del Proyecto</h2>
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h3>{{ project.title }}</h3>
            <p><strong>Descripción:</strong> {{ project.description }}</p>
            <p><strong>Fecha de Inicio:</strong> {{ project.start_date }}</p>
            <p><strong>Fecha de Finalización:</strong> {{ project.end_date }}</p>
            
            <h4>Usuarios Asignados:</h4>
            <ul>
              <li v-for="user in project.users" :key="user.id">{{ user.name }}</li>
            </ul>
            
            <h4>Tareas Asociadas:</h4>
            <ul>
              <li v-for="task in project.tasks" :key="task.id">
                <strong>{{ task.title }}</strong> - {{ task.state.name }}
                <router-link :to="'/task/' + task.id" class="btn btn-primary btn-sm">Ver Tarea</router-link>
              </li>
            </ul>
            
            <router-link to="/projects" class="btn btn-primary">Volver</router-link>
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
    };
  },
  created() {
    const projectId = this.$route.params.id;
    this.fetchProject(projectId);
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
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>
