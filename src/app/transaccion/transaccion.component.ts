import { Component, OnInit } from '@angular/core';
import { Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-transaccion',
  templateUrl: './transaccion.component.html',
  styleUrls: ['./transaccion.component.css']
})
export class TransaccionComponent implements OnInit {

  transferForm: FormGroup;
  saldoDisponible: number;
  excedeSaldo: boolean;
  textoIncorrecto: string;

  constructor(private formBuilder: FormBuilder) { 
    this.saldoDisponible = 90000;
    this.textoIncorrecto = '';
    this.transferForm = this.formBuilder.group({
      nombre: ['', Validators.compose([Validators.required, Validators.minLength(4)])],
      dni: ['', Validators.compose([Validators.required, Validators.min(1000)])],
      mail: ['', Validators.compose([Validators.required, Validators.email])],
      monto: ['', Validators.compose([Validators.min(0), Validators.required, Validators.max(400000)])],
      cbu: ['', Validators.compose([Validators.required, Validators.min(1000)])],
      motivo: ['']
    })
   }

  enviar(values) {
    console.log(values)
  }

  validarCantidad() {
    if(this.transferForm.get("monto").value>this.saldoDisponible){
      this.excedeSaldo = true;
      this.textoIncorrecto = 'El monto a transferir es mayor al saldo disponible'
      return;
    } else {
      this.excedeSaldo = false;
    }
  }

  ngOnInit(): void {
  }
  

}
