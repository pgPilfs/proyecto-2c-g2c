import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment.prod';

@Injectable({
  providedIn: 'root'
})
export class LoginService {  
  
  constructor(
  private router: Router,
  ) { }

  login(username: string, password: string) { //función de logueo
  // return this.http.post(environment.baseUrlServices + '/login', { username: username, password: password })
  }

  logout() { //función de deslogueo
    this.router.navigate(["/login"]);
  }

}
