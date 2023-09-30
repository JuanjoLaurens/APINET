<template>
    <div class="container mt-3">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">Iniciar Sesión en NetGrid</div> 
            <div class="card-body">
              <form @submit.prevent="login">
                <div class="form-group">
                  <label for="email" class="text-center">Correo Electrónico</label> 
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    v-model="email"
                    required
                  >
                </div>
  
                <div class="form-group">
                  <label for="password" class="text-center">Contraseña</label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    v-model="password"
                    required
                  >
                </div>
  
                <button type="submit" class="btn btn-success btn-block mt-3">Iniciar Sesión</button> 
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
      email: "",
      password: "",
      error: null,
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post("http://localhost:8000/api/login", {
          email: this.email,
          password: this.password,
        });

        if (response && response.data.access_token) {
          localStorage.setItem("access_token", response.data.access_token);

          this.$router.push("/projects"); 
        } else {
          console.error("Token de acceso no válido en la respuesta.");
          this.error = "Error en el inicio de sesión. Por favor, verifica tus credenciales.";
        }
      } catch (error) {
        console.error(error.response ? error.response.data : error.message);
        this.error = "Error en el inicio de sesión. Por favor, verifica tus credenciales.";
      }
    },
  },
};
</script>