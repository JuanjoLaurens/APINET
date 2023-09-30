<template>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card shadow"> 
            <div class="card-header bg-success text-white text-center">Registrate en NetGrid</div>
  
            <div class="card-body">
              <form @submit.prevent="register">
                <div class="form-group">
                  <label for="name">Nombre</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    v-model="name"
                    required
                  >
                </div>
  
                <div class="form-group">
                  <label for="email">Correo Electrónico</label>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    v-model="email"
                    required
                  >
                </div>
  
                <div class="form-group">
                  <label for="password">Contraseña</label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    v-model="password"
                    required
                  >
                </div>
  
                <button type="submit" class="btn btn-primary mt-5">Registrar</button>
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
      name: "",
      email: "",
      password: "",
      error: null,
    };
  },
  methods: {
    async register() {
      try {
        const response = await axios.post("http://localhost:8000/api/register", {
          name: this.name,
          email: this.email,
          password: this.password,
          role_id: 2,
        });

        if (response && response.data) {
          console.log(response.data);

          // Mostrar un mensaje en el alert
          alert("Registro exitoso. Ahora puedes iniciar sesión.");

          // Limpiar el formulario
          this.name = "";
          this.email = "";
          this.password = "";

          // Enfoque en el campo de nombre (o cualquier otro campo)
          this.$refs.nameInput.focus();
        } else {
          console.error("La respuesta de la API no contiene datos válidos.");
          this.error = "Error en el registro. Por favor, verifica tus datos.";
        }
      } catch (error) {
        console.error(error.response ? error.response.data : error.message);
        this.error = "Error en el registro. Por favor, verifica tus datos.";
      }
    },
  },
};
</script>
