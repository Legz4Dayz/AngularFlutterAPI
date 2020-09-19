import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BackEndTestComponent } from './back-end-test.component';

describe('BackEndTestComponent', () => {
  let component: BackEndTestComponent;
  let fixture: ComponentFixture<BackEndTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BackEndTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BackEndTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
