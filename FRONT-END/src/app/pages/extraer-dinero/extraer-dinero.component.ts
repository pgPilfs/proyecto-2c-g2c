import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Movimiento } from 'src/app/service/cliente.service';
import { ClienteService } from '../../service/cliente.service';
const ID_CUENTA = 'Id-Cuenta'

@Component({
  selector: 'app-extraer-dinero',
  templateUrl: './extraer-dinero.component.html',
  styleUrls: ['./extraer-dinero.component.css']
})
export class ExtraerDineroComponent implements OnInit {
  
  operacion: Movimiento = new Movimiento;
  ExtraerForm: FormGroup;
  id_cuenta: number;
  mostrar: boolean= false;

  constructor(private formBuilder: FormBuilder , private clienteService: ClienteService){
    this.ExtraerForm = this.formBuilder.group({
      monto: ['', Validators.compose([Validators.min(0), Validators.required, Validators.max(50000)])],
    });
   }


  ngOnInit(): void {
    this.id_cuenta = parseInt(localStorage.getItem(ID_CUENTA));
    console.log(this.id_cuenta);
  }

  enviar(values) {
    this.operacion.Monto = values.monto;
    const date = this.getDate();
    this.operacion.fechaHora = date;
    this.operacion.idTipoMovimiento = 3;
    this.operacion.Motivo = "Egreso de $";
    this.operacion.idOrigen = this.id_cuenta;
    this.operacion.idDestion = null;

    this.clienteService.onCrearMovimiento(this.operacion).subscribe((res)=>{
      console.log(res)
      if(res == "transaccion exitosa"){
        this.mostrar = true;
        this.ExtraerForm.reset();
      }
    })
  }

  getDate() {
    var date = new Date(),
      year = date.getFullYear(),
      month = (date.getMonth() + 1).toString(),
      formatedMonth = (month.length === 1) ? ("0" + month) : month,
      day = date.getDate().toString(),
      formatedDay = (day.length === 1) ? ("0" + day) : day,
      hour = date.getHours().toString(),
      formatedHour = (hour.length === 1) ? ("0" + hour) : hour,
      minute = date.getMinutes().toString(),
      formatedMinute = (minute.length === 1) ? ("0" + minute) : minute,
      second = date.getSeconds().toString(),
      formatedSecond = (second.length === 1) ? ("0" + second) : second;
    return formatedDay + "-" + formatedMonth + "-" + year + " " + formatedHour + ':' + formatedMinute + ':' + formatedSecond;
  };

  mostrarForm(){
    this.mostrar = !this.mostrar;
  }
      

}

