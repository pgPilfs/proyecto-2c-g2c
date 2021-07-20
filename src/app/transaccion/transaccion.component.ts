import { Component, OnInit } from '@angular/core';
import { Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-transaccion',
  templateUrl: './transaccion.component.html',
  styleUrls: ['./transaccion.component.css']
})
export class TransaccionComponent implements OnInit {

  transferForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { 
    this.transferForm = this.formBuilder.group({
      nombre: ['', Validators.required, Validators.minLength(4)],
      dni: ['', Validators.compose([Validators.required, Validators.minLength(4), Validators.min(0)])],
      mail: ['', Validators.compose([Validators.required, Validators.email])],
      monto: ['', Validators.compose([Validators.min(0), Validators.required, Validators.maxLength(7)])],
      cbu: ['', Validators.compose([Validators.min(0), Validators.required, Validators.minLength(4)])],
      motivo: ['', Validators.required],
      saldoDisponible: ['']
      

    })
   }

  enviar(values) {
    console.log(values)
  }

  ngOnInit(): void {
  }

}
