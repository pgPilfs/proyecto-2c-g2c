import { Component, OnInit } from '@angular/core';
import { ClienteService, Cuenta, Movimiento } from '../../../service/cliente.service';
import { Router } from '@angular/router';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
const ID_CUENTA = 'Id-Cuenta'

@Component({
  selector: 'app-ult-mov',
  templateUrl: './ult-mov.component.html',
  styleUrls: ['./ult-mov.component.css']
})
export class UltMovComponent implements OnInit {
  cuenta: Cuenta = new Cuenta();
  movimientos: any[] = [];
  id_cuenta: number;


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
      console.log(this.movimientos)
    })
  }

  cambio(){
    this.variable = !this.variable;
  }

  redirigir(palabra: string){
    if(palabra == "retirar"){
      this.router.navigate(['home/retirar'])
    }else if(palabra == "ingresar"){
      this.router.navigate(['home/ingresar'])
    }else if(palabra == "transferir"){
      this.router.navigate(['home/transferencia'])
    }
  }


}

