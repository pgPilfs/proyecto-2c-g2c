import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
//importar modulos
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { LoginComponent } from './pages/login/login.component';
import { TransferenciaComponent } from './pages/transferencia/transferencia.component';
import { UltMovComponent } from './pages/ultMovimientos/ult-mov/ult-mov.component';
import { RegisterComponent } from './pages/register/register.component';
import { InicioSesionComponent } from './pages/inicio-sesion/inicio-sesion.component';

const routes: Routes = [
  { path: 'bienvenida', component: PagBienvenidaComponent},
  { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'home', component: HomeComponent },
  { path: 'transferencia', component: TransferenciaComponent},
  { path: 'saldo', component: UltMovComponent},
  { path: 'register', component: RegisterComponent},
  { path: 'iniciosesion', component: InicioSesionComponent},


  { path: '', component: PagBienvenidaComponent },
  { path: '**', component: PagBienvenidaComponent } //Not found 404
  

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
