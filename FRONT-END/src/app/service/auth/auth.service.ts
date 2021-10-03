import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Login } from '../cliente.service';
import {HttpClient} from '@angular/common/http';
const TOKEN_KEY = 'auth-token';
const ID_CUENTA = 'Id-Cuenta';
const EMAIL = 'Email';

@Injectable({
  providedIn: 'root'
})

export class AuthService {
  url="http://www.webapigcpil.somee.com/api/login/authenticate";
  currentUserSubject: BehaviorSubject<Login>;
  currentUser: Observable<Login>;
  loggedIn= new BehaviorSubject<boolean>(false);
  objLogin: Login = new Login;

  constructor(private http:HttpClient) {
    console.log("AUTH SERVICE WORKING");
    const token = localStorage.getItem(TOKEN_KEY);
    this.objLogin.Token = token;
    this.currentUserSubject = new BehaviorSubject<Login>(this.objLogin);
    this.currentUser = this.currentUserSubject.asObservable();
 
  }

  login(usuario: Login): Observable<any> {
    return this.http.post<any>(this.url, usuario).pipe(map(data => {
      localStorage.setItem(TOKEN_KEY, data.Token);
      localStorage.setItem(ID_CUENTA, data.Id_Cuenta);
      localStorage.setItem(EMAIL, data.Email);
      this.currentUserSubject.next(data);
      this.loggedIn.next(true);
      return data;
    }));
  }

  get usuarioAutenticado(): Login {
    return this.currentUserSubject.value;
  }

  get estaAutenticado(): Observable<boolean> {
    return this.loggedIn.asObservable();
  }

   logOut(): void {
    window.sessionStorage.clear();
    localStorage.removeItem(TOKEN_KEY);
    localStorage.removeItem(ID_CUENTA);
    localStorage.removeItem(EMAIL);
    this.loggedIn.next(false);
  }
}

 
