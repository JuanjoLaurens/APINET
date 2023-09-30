import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import RegisterView from '../views/RegisterView.vue'
import LoginView from '../views/LoginView.vue'
import LogOut from '../views/LogOut.vue'
import ProjectsIndex from '../views/ProjectsIndex.vue'
import ProjectsCreate from '../views/ProjectsCreate.vue'
import ProjectsShow from '../views/ProjectsShow.vue'
import ProjectsEdit from '../views/ProjectsEdit.vue'
import TaskIndex from '../views/TaskIndex.vue'
import TaskCreate from '../views/TaskCreate.vue'
import TaskEdit from '../views/TaskEdit.vue'
import TaskShow from '../views/TaskShow.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/register',
    name: 'register',
    component: RegisterView
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/logout',
    name: 'logout',
    component: LogOut
  },
  {
    path: '/projects',
    name: 'projects',
    component: ProjectsIndex
  },
  {
    path: '/projects/create',
    name: 'create',
    component: ProjectsCreate
  },
  {
    path: '/projects/:id',
    name: 'show',
    component: ProjectsShow
  },
  {
    path: '/projects/edit/:id',
    name: 'edit',
    component: ProjectsEdit
  },
  {
    path: '/task',
    name: 'task',
    component: TaskIndex
  },
  {
    path: '/task/create',
    name: 'tcreate',
    component: TaskCreate
  },
  {
    path: '/task/edit/:id',
    name: 'tedit',
    component: TaskEdit
  },
  {
    path: '/task/:id',
    name: 'tshow',
    component: TaskShow
  },


]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
