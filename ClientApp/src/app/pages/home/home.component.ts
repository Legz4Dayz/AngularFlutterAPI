import { AfterViewInit, Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { combineLatest, fromEvent, Observable, of } from 'rxjs';
import { map, tap } from 'rxjs/operators';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

  idTest2 : Observable<any>
  test3 : Observable<Event> 
  test4 : Observable<Event>
  

  YesNoTest : boolean;
  yes : string = "yes"
  no: string = "no" //lol

  ngOnInit(){
    let idTest = fromEvent(document.getElementById('test'), 'click')
      .subscribe(event => console.log(event));

    let idTest2 = fromEvent(document.getElementById('test2'), 'mousemove')
      .pipe(tap(() => this.YesNoTest = false))
      .subscribe(event => console.log(event));                             //Coolest example
    
    this.test3 = fromEvent(document.getElementById('test4'), 'mousemove');
    this.test4 = fromEvent(document.getElementById('test4'), 'click');

    combineLatest([this.test3, this.test4]).pipe(
      map(([test, test2]) => {
        return test.type + ' ' + test2.type
      }),
      tap(() => {
        this.YesNoTest = true;
      })
      ).subscribe(event =>{ 
        console.log(event);
      });
  }
}
