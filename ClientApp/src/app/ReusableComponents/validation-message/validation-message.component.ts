import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-validation-message',
  templateUrl: './validation-message.component.html',
  styleUrls: ['./validation-message.component.css']
})
export class ValidationMessageComponent {

  @Input() successText : string;
  @Input() failText : string;
  @Input() boolEvent: boolean;

  failure = false;
  success = true;

  constructor() { }

}
