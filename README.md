## KNPathTableViewController

KNPathTableViewController is an UITableViewController with an customizable overlay panel, inspired by [Path app](https://path.com/).

<img src="https://github.com/kentnguyen/KNPathTableViewController/blob/master/screenshot1.png?raw=true" />``
<img src="https://github.com/kentnguyen/KNPathTableViewController/blob/master/screenshot2.png?raw=true" />

### Demo

Download a demo clip [here](https://github.com/kentnguyen/KNPathTableViewController/blob/master/demo_clip.mov?raw=true) (1MB, .mov)

### Features
* Implemented as generic UIView with UIImageView background
* Exact match of Path animation and delayed sliding out
* Handle overscroll correctly
* 6 callback events for any needs (see `.h`)

### Installation
* Import 2 source files and 2 graphic files to your project

### How to use

1. Make a custom class from `KNPathTableViewController`
2. Init with custom size of overlay UIView
3. The image size will be detected automatically and stretch at half way point
4. Override methods found in `.h`

Read my [blog post](http://kentnguyen.com/) for detailed usage

### License
KNPathTableViewController is licensed under MIT License
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

### References

There was a partial implementation by FMInfoPanelViewController but it has many limitations compare to the Path app
http://blog.madefm.com/post/13817640556/ios-devcorner-attaching-an-info-panel-to-a