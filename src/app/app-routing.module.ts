import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
//importar modulos
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { TransaccionComponent } from './transaccion/transaccion.component';
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { LoginComponent } from './pages/login/login.component';
import { TransferenciasComponent } from './transferencias/transferencias.component';
import { ContactoComponent } from './contacto/contacto.component';
import { PagoServiciosComponent } from './pago-servicios/pago-servicios.component';

const routes: Routes = [
  { path: 'bienvenida', component: PagBienvenidaComponent},
  { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'home', component: HomeComponent },
  { path: 'transaccion', component: TransaccionComponent},
  { path: 'transferencias',component: TransferenciasComponent},
   {path: 'contacto', component: ContactoComponent},
  { path: 'pagos', component: PagoServiciosComponent},

  { path: '', component: PagBienvenidaComponent },
  { path: '**', component: PagBienvenidaComponent } //Not found 404
  

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
