import { AfterViewInit, Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { combineLatest, fromEvent, Observable, of } from 'rxjs';
import { map, mergeMap, tap } from 'rxjs/operators';
import { CatPictureService } from 'src/app/shared/cat-picture.service';
import { CatLink, Convert } from 'src/app/models/CatLink';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

  constructor(private catpics : CatPictureService){}

  idTest2 : Observable<any>
  test3 : Observable<Event>
  test4 : Observable<Event>

  YesNoTest : boolean;
  yes : string = "yes"
  no: string = "no" //lol
  test = new CatLink();

  test5 : Observable<Event>
  idTest5: Observable<CatLink>

  combinedClick$ : Observable<string>
  ngOnInit(){
    this.catpics.getCatPicture().subscribe(
      data => this.test = Convert.toCatLink(data)[0]
    );

    this.idTest5 = this.catpics.getCatPicture().pipe(
      map(data => {
        return Convert.toCatLink(data)[0];
      })
    );

    this.test5 = fromEvent(document.getElementById('test5'), 'mousemove');

    let idTest = fromEvent(document.getElementById('test'), 'click')
      .subscribe(event => console.log(event));

    // this.combinedClick$ = combineLatest([this.idTest5, this.test5 ]).pipe(
    //   map(([catLink , mouse]) => catLink.url)
    // );

    this.combinedClick$ = this.test5.pipe(
        mergeMap((e : Event) => this.idTest5.pipe(map(x => x.url)))
        // map(([catLink , mouse]) => catLink.url
      );

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
