import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'custom-button',
  templateUrl: './custom-button.component.html',
  styleUrls: ['./custom-button.component.css']
})
export class CustomButtonComponent implements OnInit {

  @Input() buttonText : string;
  @Output() outPut : EventEmitter<any> = new EventEmitter();

  constructor() { }

  ngOnInit(): void {
  }

}
