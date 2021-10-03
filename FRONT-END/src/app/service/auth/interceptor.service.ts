import { Injectable } from '@angular/core';
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest ,HttpHeaders} from '@angular/common/http';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class JwtInterceptor implements HttpInterceptor{

  constructor( private authService: AuthService) { 
    
  }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = this.authService.usuarioAutenticado.Token;
    console.log("INTERCEPTOR WORKING");

    if(token) {
      req = req.clone({
        setHeaders:{
          'Authorization':  `Bearer ${token}`
        }
      });
    }

    console.log('headers:', req.headers);
    return next.handle(req);
  }

}
