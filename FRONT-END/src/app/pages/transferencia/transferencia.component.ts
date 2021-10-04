import { Component, OnInit } from '@angular/core';
import { Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.css']
})
export class TransferenciaComponent implements OnInit {

  transferForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { 
    this.transferForm = this.formBuilder.group({
      nombre: ['', Validators.compose([Validators.required, Validators.minLength(4)])],
      dni: ['', Validators.compose([Validators.required, Validators.min(1000)])],
      mail: ['', Validators.compose([Validators.required, Validators.email])],
      monto: ['', Validators.compose([Validators.min(0), Validators.required, Validators.max(400000)])],
      cbu: ['', Validators.compose([Validators.required, Validators.min(1000)])],
      motivo: [''],
      saldoDisponible: ['20000']
      

    })
   }

  enviar(values) {
    console.log(values)
  }

  ngOnInit(): void {
  }

}
