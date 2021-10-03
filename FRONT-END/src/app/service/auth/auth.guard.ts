import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable, of } from 'rxjs';
import { AuthService } from './auth.service';
import { catchError, map, take } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(
    private authService: AuthService, private router: Router
  ) { }

  canActivate(
    route: ActivatedRouteSnapshot, 
    state: RouterStateSnapshot):  Observable <boolean>  {
    console.log("GUARDS WORKING");
         return this.authService.estaAutenticado.pipe(
          map(e => {
            console.log(e);
            if (e) {
              return true;
            }
            else
            {
              this.router.navigate(['/iniciosesion']);
              return false;
            }
          }),
          catchError((err) => {
            this.router.navigate(['/iniciosesion']);
            return of(false);
          })
        );

  
}
}
