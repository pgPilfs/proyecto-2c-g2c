import { Component, OnInit} from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

  export class LoginComponent implements OnInit  {
    signupForm: FormGroup;
  
         constructor(private formBuilder: FormBuilder) {
      this.signupForm = this.formBuilder.group({

        usuario: ['', Validators.compose([Validators.required, Validators.minLength(4)])],
        password: ['', Validators.compose([Validators.required, Validators.minLength(6)])],
        
      })
    }

    ngOnInit(): void {

    }
    enviar(values){
      console.log(values);
    }
  
    }

 /***
  * constructor(private fb: FormBuilder) {}
  * public frmSignup: FormGroup;
  * createSignupForm(): FormGroup {}
  * createSignupForm(): FormGroup {
  return this.fb.group(
    {
      // email is required and must be a valid email email
      USARIA LA VARIABLE USUARIO?
      email: [null, Validators.compose([
         Validators.email,
         Validators.required])
      ],
      password: [ null, Validators.compose([
         // 1. Password Field is Required
         Validators.required,
         // 2. check whether the entered password has a number
         CustomValidators.patternValidator(/\d/, { hasNumber: true }),
         // 3. check whether the entered password has upper case letter
         CustomValidators.patternValidator(/[A-Z]/, { hasCapitalCase: true }),
         // 4. check whether the entered password has a lower-case letter
         CustomValidators.patternValidator(/[a-z]/, { hasSmallCase: true }),
         // 5. check whether the entered password has a special character
         CustomValidators.patternValidator(/[ [!@#$%^&*()_+-=[]{};':"|,.<>/?]/](<mailto:!@#$%^&*()_+-=[]{};':"|,.<>/?]/>), { hasSpecialCharacters: true }),
         // 6. Has a minimum length of 8 characters
         Validators.minLength(8)])
      ],
      confirmPassword: [null, Validators.compose([Validators.required])]
   },
   {
      // check whether our password and confirm password match
      validator: CustomValidators.passwordMatchValidator
   });
}
  */
