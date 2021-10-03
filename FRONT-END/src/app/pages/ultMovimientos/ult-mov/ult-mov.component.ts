import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ClienteService, Cuenta, Movimiento } from '../../../service/cliente.service';

const ID_CUENTA = 'Id-Cuenta'

@Component({
  selector: 'app-ult-mov',
  templateUrl: './ult-mov.component.html',
  styleUrls: ['./ult-mov.component.css']
})
export class UltMovComponent implements OnInit {
  cuenta: Cuenta = new Cuenta();
  movimientos: Movimiento[] = [];
  id_cuenta: number;
  imagenRetiro: string;
  imagenIngreso: string;


  variable: boolean = true;
  mostrarCvu: boolean= false;

  constructor( private clienteService: ClienteService, private router: Router) { }

  ngOnInit(): void {
    this.id_cuenta = parseInt(localStorage.getItem(ID_CUENTA));
    console.log(this.id_cuenta);
    this.clienteService.obtenerCuenta(this.id_cuenta).subscribe((res)=>{
      this.cuenta = res;
    })
    this.clienteService.obtenerMovimientos(this.id_cuenta).subscribe((res)=>{
      this.movimientos = res;
      this.imagenRetiro = "./../assets/img/pngwing.com-menos.png";
      this.imagenIngreso = "./../assets/img/pngwing.com-mas.png";
      console.log(this.movimientos)
    })
  }

  cambio(){
    this.variable = !this.variable;
  }


}

