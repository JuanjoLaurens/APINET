<template>
  <div class="container mt-3">
    <h2 class="text-center text-success">Crear Tarea</h2>
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <form @submit.prevent="createTask">
              <div class="mb-3">
                <label for="title" class="form-label">Título de la Tarea</label>
                <input type="text" class="form-control" id="title" v-model="task.title" required>
              </div>
              <div class="mb-3">
                <label for="description" class="form-label">Descripción</label>
                <textarea class="form-control" id="description" v-model="task.description" required></textarea>
              </div>
              <div class="mb-3">
                <label for="project" class="form-label">Proyecto</label>
                <select class="form-select" id="project" v-model="task.project_id" required>
                  <option v-for="project in availableProjects" :key="project.id" :value="project.id">{{ project.title }}</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="state" class="form-label">Estado</label>
                <select class="form-select" id="state" v-model="task.task_state_id" required>
                  <option v-for="state in availableStates" :key="state.id" :value="state.id">{{ state.name }}</option>
                </select>
              </div>
              <button type="submit" class="btn btn-success">Crear Tarea</button>
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
      task: {
        title: "",
        description: "",
        project_id: null,
        task_state_id: null,
      },
      availableProjects: [], 
      availableStates: [], 
    };
  },
  created() {
    this.fetchAvailableProjects();
    this.fetchAvailableStates(); 
  },
  methods: {
    async fetchAvailableProjects() {
      try {
        const response = await axios.get("http://localhost:8000/api/projects");
        this.availableProjects = response.data.data;
      } catch (error) {
        console.error(error);
      }
    },
    async fetchAvailableStates() {
      try {
        const response = await axios.get("http://localhost:8000/api/task-states");
        this.availableStates = response.data.data;
      } catch (error) {
        console.error(error);
      }
    },
    async createTask() {
      try {
        const accessToken = localStorage.getItem("access_token");
        const response = await axios.post("http://localhost:8000/api/tasks", {
          ...this.task,
        }, {
          headers: {
            Authorization: `Bearer ${accessToken}`,
          },
        });

        console.log(response.data);

        this.$router.push("/task");
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>
