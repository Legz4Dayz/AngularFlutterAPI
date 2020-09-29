import { AfterViewInit, Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { combineLatest, fromEvent, Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

  weight = of(70, 72, 76, 79, 75);
  height = of(1.76, 1.77, 1.78);
  bmi = combineLatest([this.height, this.weight]).pipe(
    map(([height, weight]) => {
      return weight / (height * height)
    })
  );
  print = this.bmi.subscribe(
    data => console.log(data)
  );

 
  button: HTMLButtonElement;
  input: HTMLInputElement;
  mouseX: number;
  mouseY: number;
  
  idTest;
  idTest2;

  ngOnInit() {
    this.button = document.querySelector('#first') as HTMLButtonElement;
    let buttonStream$ = fromEvent(this.button, 'click')
        .subscribe(event => console.log(event));

    this.idTest = document.getElementById('test');
    let testStream$ = fromEvent(this.idTest, 'mousemove')
      .subscribe(event => console.log(event));

    let idTest2 = fromEvent(document.getElementById('test2'), 'mousemove')
      .subscribe(event => console.log(event));

    this.input = document.querySelector('#second') as HTMLInputElement;
    let inputStream$ = fromEvent(this.input, 'keyup')
        .subscribe(
          event => console.log(event),
          error => console.log(error),
          () => console.log('Complete')
        );

    let moveStream$ = fromEvent(document, 'mousemove')
        .subscribe(event => {
          this.mouseX = event.clientX;
          this.mouseY = event.clientY;          
          });
    }
}
