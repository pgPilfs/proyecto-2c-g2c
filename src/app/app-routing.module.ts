import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
//importar modulos
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { TransaccionComponent } from './transaccion/transaccion.component';

const routes: Routes = [
  { path: 'login', component: HomeComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'home', component: HomeComponent },
  { path: 'transaccion', component: TransaccionComponent},

  { path: '', component: HomeComponent },
  { path: '**', component: HomeComponent } //Not found 404
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
