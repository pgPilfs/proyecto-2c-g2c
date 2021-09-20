import { Component, OnInit } from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-login-test',
  templateUrl: './login-test.component.html',
  styleUrls: ['./login-test.component.css']
})
export class LoginTestComponent implements OnInit {

  loginForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { 
    this.loginForm = this.formBuilder.group({

      mail: ['', Validators.compose([Validators.required, Validators.email])],
      password: ['', Validators.compose([Validators.required, Validators.minLength(6)])]

    })
  }

  enviar(values){
    console.log(values);
  }

  ngOnInit(): void {
  }

}
