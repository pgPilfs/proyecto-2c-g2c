import { Component, OnInit } from '@angular/core';
import { DataService } from '../../../service/data.service';
import { ClienteService, Cuenta, Movimiento } from '../../../service/cliente.service';

@Component({
  selector: 'app-ult-mov',
  templateUrl: './ult-mov.component.html',
  styleUrls: ['./ult-mov.component.css']
})
export class UltMovComponent implements OnInit {

  cuenta: Cuenta ={CVU:"", Saldo:0};
  cliente: any;
  movimientos!: Movimiento[];


  variable: boolean = true;
  mostrarCvu: boolean= false;

  constructor(private dataService: DataService, private clienteService: ClienteService) { }

  ngOnInit(): void {
    this.dataService.bandera$.subscribe((res)=>{
      this.clienteService.obtenerUsuario(res).subscribe((res2)=>{
        this.cliente = res2;
        this.clienteService.obtenerCuenta(this.cliente.IdCuenta).subscribe((res3)=>{
          console.log(res3);
          this.cuenta = {CVU: res3.CVU, Saldo: res3.Saldo};
          console.log(this.cuenta);
        })
        this.clienteService.obtenerMovimientos(this.cliente.IdCuenta).subscribe((res4)=>{
          this.movimientos = res4;
          console.log(this.movimientos)
        })
      })
    })
  }

  cambio(){
    this.variable = !this.variable;
  }


}

