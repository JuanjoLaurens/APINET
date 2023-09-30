<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <router-link class="navbar-brand" to="/">APINET</router-link>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <div v-if="isAuthenticated">
            <li class="nav-item d-inline">
              <router-link class="nav-link" to="/projects">Proyectos</router-link>
            </li>
            <li class="nav-item d-inline">
              <router-link class="nav-link" to="/task">Tareas</router-link>
            </li>
            <li class="nav-item d-inline">
              <router-link class="nav-link" to="/logout">Cerrar Sesión</router-link>
            </li>
          </div>
          
          <div v-else>
            <li class="nav-item d-inline">
              <router-link class="nav-link" to="/login">Iniciar Sesión</router-link>
            </li>
            <li class="nav-item d-inline">
              <router-link class="nav-link" to="/register">Registro</router-link>
            </li>
          </div>
        </ul>
      </div>
    </div>
  </nav>
  <router-view />
</template>

<script>
export default {
  computed: {
    isAuthenticated() {
      const accessToken = localStorage.getItem("access_token");
      return !!accessToken;
    },
  },
};
</script>
