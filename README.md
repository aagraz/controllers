#View Controllers

Several container ViewControllers that help laying out other ViewControllers

##FRRViewController

A subclass of *UIViewController* that adds support for several of the ViewControllers of this
package. 

All ViewControllers that use any of the container VCs should inherit from *FRRViewController* instead
of *UIVIewController*.

All instances and subclasses of *FRRViewController* have a property called _rotatingViewController_ that behaves 
like the _navigationController_ property in *UIVIewController*: it allows any *FRRViewController* to access the
*FRRRotatingViewController* it is in. If it's not in a *FRRRotatingViewController*, the property is set to nil.

##FRRRotatingViewController
A controller of controllers that displays a different UIView depending on the rotation of the device. This comes 
handy when you need to change the UI of your app. A good example is Apple's Calculator, that changes from normal
(in portrait mode) to scientific in layout mode.

Creating a single UIView that repositions and creates new subviews on rotation is out of question. The best 
solution is to have 2 View Controllers: one for portrait and another for landscape.  

*FRRRotatingViewController* handles this _automagically_ for you: just initialize it with 2 *FRRViewController*s
and it will do the magic for you. 

	-(FRRRotatingViewController *) initWithLandscapeViewController: (FRRViewController *) landscape 
	                                     andPortraitViewController: (FRRViewController *) portrait;

Both sub view controllers can be delegates and be notified when the *FRRRotatingViewController* switches sub view 
controllers.

Check the sample project to see it in action. 

##Requisites and assumptions

This code assumes _ARC_.