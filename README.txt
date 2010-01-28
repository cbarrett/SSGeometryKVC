SSGeometryKVC makes working with primitive geometry types in Cocoa and Cocoa Touch much less painful.

Normally to manipulate the frame of a view, you have to do all this work!

    CGRect frame = [view frame];
    frame.origin.x = 5;
    [view setFrame:frame];

With SSGeometryKVC, this is now one line (as long as the class is KVC compliant).

    [view mutableRectForKey:@"frame"].x = 5;
    
Cocoaheads will notice that the similarity to KVC's -mutableArrayForKey:. The similarity is intentional. Anyway, that's just one example of what you can do. At this point, the best documentation is the headers. Feel free to contribute docs, improvements, etc.

This project lives on both Bitbucket (http://bitbucket.org/cbarrett/ssgeometrykvc) and Github (http://github.com/cbarrett/ssgeometrykvc/). Feel free to contribute to either one. I personally use Mercurial; Git support brought to you through hg-git (http://bitbucket.org/durin42/hg-git/).