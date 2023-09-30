<template>
    <div>
      
  
      <button @click="logout" class="btn-danger btn aling ml-5">Cerrar Sesión</button>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  
  export default {
    methods: {
      async logout() {
        try {
          // Realizar la solicitud POST a la URL de logout
          await axios.post("http://localhost:8000/api/logout", {}, {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("access_token")}`,
            },
          });
  
          // Eliminar el token de acceso del localStorage
          localStorage.removeItem("access_token");
  
          // Redireccionar a la página de inicio de sesión u otra página deseada
          this.$router.push("/login");
        } catch (error) {
          console.error(error.response.data);
        }
      },
    },
  };
  </script>
  