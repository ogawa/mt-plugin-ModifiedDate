# ModifiedDate Plugin

A plugin for adding MTModifiedDate variable(function) tag, which shows modified dates for specified files and index-templates.

## Changes

 * 0.01 (2007-01-22 18:05:23 +0900):
   * Initial release.

## Overview

ModifiedDate plugin allows you to obtain ''modified dates'' for specified files and index templates.

    <$MTModifiedDate file="filename"$>
    <$MTModifiedDate template="index template name"$>

''filename'' should be an absolute filename with full-path, or a relative filename from ''Blog Site Path''.

MTModifiedDate can be used with date-format options, as like MTDate and MTEntryDate.

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html]().

## Author & Copyright

Copyright 2007, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
