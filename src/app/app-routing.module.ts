import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
// importar modulos
import { ConsultaOperacionesComponent } from './pages/consulta-operaciones/consulta-operaciones.component';
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { RetirarDineroComponent } from './pages/retirar-dinero/retirar-dinero.component';

const routes: Routes = [
  { path: 'login', component: HomeComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'home', component: HomeComponent },
  { path: 'retiros', component: RetirarDineroComponent},
  { path: 'consultas', component: ConsultaOperacionesComponent},

  { path: '', component: HomeComponent },
  { path: '**', component: HomeComponent } // Not found 404
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
