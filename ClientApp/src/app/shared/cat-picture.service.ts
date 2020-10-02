import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CatLink, Convert } from 'src/app/models/CatLink'
import { JsonPipe } from '@angular/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CatPictureService {
  constructor( private http: HttpClient ) { }
  result : CatLink;

  getCatPicture() : Observable<string> {
      return this.http.get('https://api.thecatapi.com/v1/images/search',
       { responseType: "text" });
  }
}
