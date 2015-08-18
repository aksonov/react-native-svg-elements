# React Native SVG Elements
Use React Native to draw SVG Elements.

## Supported SVG Elements
- Path
- Use
- Defs
- Mask
- LinearGradient
- G

##Example
Draw Sine function
```js
'use strict';

function drawSine(t) {
  var path = `M ${0} ${Math.sin(t) * 100 + 120}`;
  var x, y;

  for (var i = 0; i <= 10; i += 0.5) {
    x = i * 50;
    y = Math.sin(t + x) * 100 + 120;
    path = path + ` L ${x} ${y}`
  }

  return path;
}


var React = require('react-native');
var {
  StyleSheet,
  Text,
  View,
} = React;

var {Svg, Path} = require('react-native-svg-elements');
var TimerMixin = require('react-timer-mixin');

var Wave = React.createClass({
  mixins: [TimerMixin],

  getInitialState() {
    return {t: 0}
  },

  componentDidMount() {
    this.setInterval(this.updateTime, 16);
  },

  updateTime() {
    this.setState({t: this.state.t + 0.05});
  },

  render() {
    return (
      <View style={{flex: 1, backgroundColor: 'black', justifyContent: 'center', alignItems: 'center'}}>
        <Svg width={500} height={500} style={{width: 320, height: 350}}
             forceUpdate={this.state.t.toString()}>
          <Path fill="none" stroke="#00D8FF" strokeWidth="3" strokeMiterlimit="10"
                d={drawSine(this.state.t)} />
        </Svg>
      </View>
    );
  }
});

```

## Getting started
1. `npm install react-native-svg-elements --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. add `./node_modules/react-native-svg-elements/RCTSvg.xcodeproj`
4. In the XCode project navigator, select your project, select the `Build Phases` tab and in the `Link Binary With Libraries` section add **libRCTSvg.a**
5. `var Svg = require('react-native-svg-elements'); var Path = Svg.Path`

## Todo
- [ ] Support Rect
- [ ] Support onPress and other events

## Credits
Thanks to @GenerallyHelpfulSoftware for SVG rendering library (https://github.com/GenerallyHelpfulSoftware/SVGgh).
Thanks to @brentvatne for React Native SVG library (https://github.com/brentvatne/react-native-svg) examples given from.
