import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
//importar modulos
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { TransferenciaComponent } from './pages/transferencia/transferencia.component';
import { UltMovComponent } from './pages/ultMovimientos/ult-mov/ult-mov.component';
import { RegisterComponent } from './pages/register/register.component';
import { InicioSesionComponent } from './pages/inicio-sesion/inicio-sesion.component';
import { HomeComponent } from './pages/home/home.component';
import { AuthGuard } from './service/auth/auth.guard';

const routes: Routes = [
  { path: 'bienvenida', component: PagBienvenidaComponent},
  { path: 'iniciosesion', component: InicioSesionComponent},
  { path: 'registro', component: RegisterComponent },

  { path: 'home', component: HomeComponent ,  canActivate: [AuthGuard],
  children:[
    {path:'movimientos', component: UltMovComponent},
    {path: 'transferencia', component: TransferenciaComponent},
  ]},

  { path: '', redirectTo: '/bienvenida', pathMatch: 'full' },
  { path: '**', component: PagBienvenidaComponent } //Not found 404
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
