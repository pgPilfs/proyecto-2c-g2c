import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
//importar modulos
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';

import { HomeComponent } from './pages/home/home.component';

import { IngresarDineroComponent } from './pages/ingresar-dinero/ingresos.component';
import { InicioSesionComponent } from './pages/inicio-sesion/inicio-sesion.component';
import { RegisterComponent } from './pages/register/register.component';
import { AuthGuard } from './service/auth/auth.guard';
import { UltMovComponent } from './pages/ultMovimientos/ult-mov/ult-mov.component';
import { TransferenciaComponent } from './pages/transferencia/transferencia.component';
import { ExtraerDineroComponent } from './pages/extraer-dinero/extraer-dinero.component';


const routes: Routes = [
  { path: 'bienvenida', component: PagBienvenidaComponent},
  { path: 'iniciosesion', component: InicioSesionComponent},
  { path: 'registro', component: RegisterComponent },

  { path: 'home', component: HomeComponent ,  canActivate: [AuthGuard],
  children:[
    {path:'movimientos', component: UltMovComponent},
    {path: 'transferencia', component: TransferenciaComponent},
    {path: 'ingresar', component: IngresarDineroComponent},
    {path: 'retirar', component: ExtraerDineroComponent}
  ]},

  { path: '', redirectTo: '/bienvenida', pathMatch: 'full' },
  { path: '**', component: PagBienvenidaComponent } //Not found 404
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
