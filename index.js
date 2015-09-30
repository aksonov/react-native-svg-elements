'use strict';

var React = require('react-native');

var {
    View, requireNativeComponent,
    PropTypes,
    Dimensions,
    TouchableOpacity,
    NativeModules
    } = React;

var windowSize = Dimensions.get('window');
var dHeight = windowSize.height;
var dWidth = windowSize.width;
var RCTUIManager = NativeModules.UIManager;

function generateChildren(props, scale){
    var i=0;
    var res=[];
    React.Children.forEach(props.children, function(el) {
        //console.log("Child:"+el.type.name+" "+el.props.id);
        var id = el.props.id;
        if (props.remove && props.remove.indexOf(id)!=-1){
            return;
        }
        var passProps = props.passProps || {};
        var customProps = passProps[id] || {};
        var elProps = el.props;
        // apply stroke, fill to children
        var {stroke, strokeWidth, fill, fillRule} = props;
        var map = {stroke, strokeWidth, fill, fillRule, key:i++, scale:scale, passProps: props.passProps, remove:props.remove, ...elProps, ...customProps};
        res.push(React.cloneElement(el, map));
    });
    return res;
}


class Use extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGUse style={{position:'absolute'}} ref="child" {...this.props} />;
    }
}

Use.propTypes = {
    xlinkHref: PropTypes.string,
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    id: PropTypes.string,
    scale: PropTypes.number,
};
var SVGUse = requireNativeComponent('RCTSvgUse', Use);

class Path extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        //console.log("SVGPATH d="+this.props.d);
        var { transform, ...props } = this.props;
        if (transform)
            props._transform = transform;
        if (props.onPress){
            return <TouchableOpacity onPress={props.onPress}><SVGPath ref="child" style={{position:'absolute'}}  {...props}  /></TouchableOpacity>;
        } else {
            return <SVGPath ref="child" pointerEvents="none" style={{position:'absolute'}}  {...props}  />;
        }
    }
}

Path.propTypes = {
    fill: PropTypes.string,
    fillRule: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeLinecap: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    d: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    _transform: PropTypes.string,
    scale: PropTypes.number,
};

var SVGPath = requireNativeComponent('RCTSvgPath', Path);

class Rect extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        //console.log("SVGPATH d="+this.props.d);
        var { width, height, x, y, isDef, ...props } = this.props;
        props._height = height;
        props._width = width;
        if (isDef) {
            props.x = x;
            props.y = y;
            return <SVGRect style={{position:'absolute'}} ref="child" {...props}/>;
        } else {
            props.x = "0";
            props.y = "0";
            return <G scale={props.scale} transform={[{translateX: x}, {translateY: y}]}><SVGRect
                style={{position:'absolute'}} ref="child" {...props}/></G>;
        }
//        return <SVGRect style={{position:'absolute',top:0,left:0,width:width*scale,height:height*scale, backgroundColor:'transparent'}} ref="child" {...props}/>;
    }
}

Rect.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    x: PropTypes.string,
    y: PropTypes.string,
    rx: PropTypes.string,
    ry: PropTypes.string,
    _width: PropTypes.string,
    _height: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    opacity: PropTypes.string,
    mask: PropTypes.string,
    scale: PropTypes.number,
};

var SVGRect = requireNativeComponent('RCTSvgRect', Rect);

class Polygon extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGPolygon style={{position:'absolute'}} ref="child" {...this.props}/>;
    }
}

Polygon.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    points: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    scale: PropTypes.number,
};

var SVGPolygon = requireNativeComponent('RCTSvgPolygon', Polygon);

class Circle extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }
    render() {
        var {r, ...props} = this.props;
        props.rx = r;
        props.ry = r;
        return <SVGEllipse style={{position:'absolute'}} ref="child" {...props}/>;
    }
}

Circle.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    r: PropTypes.string,
    cx: PropTypes.string,
    cy: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    scale: PropTypes.number,
};

class Ellipse extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }
    render() {
        return <SVGEllipse style={{position:'absolute'}} ref="child" {...this.props}/>;
    }
}

Ellipse.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    rx: PropTypes.string,
    ry: PropTypes.string,
    cx: PropTypes.string,
    cy: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    scale: PropTypes.number,
};

var SVGEllipse = requireNativeComponent('RCTSvgEllipse', Ellipse);

class Defs extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        var {children, ...props} = this.props;
        var res = [];
        React.Children.forEach(children, function(el) {
            res.push(React.cloneElement(el, {isDef: 1}));
        });
        return <SVGDefs ref="child" {...props}>{res}</SVGDefs>;
    }
}

Defs.propTypes = {
};
var SVGDefs = requireNativeComponent('RCTSvgDefs', Defs);


class Mask extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGMask ref="child" {...this.props} />;
    }
}

Mask.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    scale: PropTypes.number,
};
var SVGMask = requireNativeComponent('RCTSvgMask', Mask);

class LinearGradient extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        var stop = [];
        React.Children.forEach(this.props.children, function (el){
           stop.push(el.props.stopColor+","+el.props.offset);
        });

        return <SVGLinearGradient ref="child" stop={stop} {...this.props} />;
    }
}

class Stop extends React.Component {
    render(){
        return null;
    }
}

LinearGradient.propTypes = {
    id: PropTypes.string,
    stop: PropTypes.array,
    x1: PropTypes.string,
    x2: PropTypes.string,
    y1: PropTypes.string,
    y2: PropTypes.string,
};

var SVGLinearGradient = requireNativeComponent('RCTSvgLinearGradient', LinearGradient);

class G extends React.Component {
    constructor(props){
        super(props);
        this.state = {width:0, height:0};

    }
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    //componentDidMount() {
    //    // https://github.com/facebook/react-native/issues/953
    //    setTimeout(this.measureMainComponent.bind(this));
    //}
    //measureMainComponent() {
    //    this.refs.child.measure((ox, oy, width, height) => {
    //
    //        console.log(ox, oy, width, height);
    //    });
    //}
    //
    //
    //onLayout(event) {
    //    var {x, y, width, height} = event.nativeEvent.layout;
    //    this.setState({width, height});
    //    console.log("G onLayout:"+JSON.stringify(event.nativeEvent.layout))
    //}
    //
    render() {
        //console.log("G render()");
        var scale = this.props.scale;
        var children = generateChildren(this.props, scale);

        var { transform, ...props } = this.props;
        if (transform) {
            var res = [];
            transform.forEach(function (el) {
                var p = {};
                for (var key in el) {
                    p[key] = key.indexOf('translate') != -1 ? el[key] * scale : el[key];
                }
                res.push(p);
            });
            transform = res;
       }

        var styles = {
            backgroundColor:'transparent',
            position:'absolute',
            transform: transform
        };
        if (this.props.onPress){
            return (
                <TouchableOpacity ref="child" style={styles} {...props}>
                    {children}
                </TouchableOpacity>
            );
        } else {
            return (
                <View ref="child"  style={styles} {...props}>
                    {children}
                </View>
            );
        }
    }
}

G.propTypes = {
    _transform: PropTypes.string,
    style: PropTypes.any,
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    scale: PropTypes.number,
};


class SvgDocument extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGDocument ref="child" {...this.props} />;
    }
}

SvgDocument.propTypes = {
    artworkPath: PropTypes.string,
};

var SVGDocument = requireNativeComponent('RCTSvgDocument', SvgDocument);

class Svg extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    onLayout(event){
        //console.log("onLayout "+JSON.stringify(event.nativeEvent.layout));
    }
    render() {
        var scale = dWidth/this.props.width;
        var children = generateChildren(this.props, scale);
        var {width, height, ...props} = this.props;
        return (
            <SVG ref="child" style={{position:'absolute',backgroundColor:'transparent',top:0,bottom:0,left:0,right:0}} {...props} scale={scale} onLayout={this.onLayout.bind(this)}>{children}</SVG>
        );
    }
}

Svg.propTypes = {
    width: PropTypes.number,
    height: PropTypes.number,
    style: PropTypes.any
};
var SVG = requireNativeComponent('RCTSvg', Svg);

class Image extends React.Component {
    render(){
        var scale = this.props.scale || 1;
        return (
            <React.Image  {...this.props} style={{"position":"absolute",overflow:'hidden',"top":Math.trunc(this.props.y*scale+2*scale), left:Math.trunc(this.props.x*scale+2*scale), width:Math.trunc(this.props.width*scale-4*scale), height: Math.trunc(this.props.height*scale-4*scale)}}/>
        );    }
}
Image.propTypes = {
    xlinkHref: PropTypes.any,
    _x: PropTypes.number,
    _y: PropTypes.number,
    _width: PropTypes.number,
    _height: PropTypes.number,
    mask: PropTypes.string,
    id: PropTypes.string,
    scale: PropTypes.number,
};


class ClearButton extends React.Component {
    render(){
        return  <G {...this.props}><Path  {...this.props} transform="translate(-680,0)" d="M699.611165,45.3 L694.644418,40.333253 L693.8,39.4888354 L695.488835,37.8 L696.333253,38.6444177 L701.3,43.6111646 L706.266747,38.6444177 L707.111165,37.8 L708.8,39.4888354 L707.955582,40.333253 L702.988835,45.3 L707.955582,50.266747 L708.8,51.1111646 L707.111165,52.8 L706.266747,51.9555823 L701.3,46.9888354 L696.333253,51.9555823 L695.488835,52.8 L693.8,51.1111646 L694.644418,50.266747 L699.611165,45.3 Z M701,63 C710.941125,63 719,54.9411255 719,45 C719,35.0588745 710.941125,27 701,27 C691.058875,27 683,35.0588745 683,45 C683,54.9411255 691.058875,63 701,63 Z" fill="#D8D8D8"/></G>
    }
}

class Text extends React.Component {
    constructor(props){
        super(props);
        this.state = {showClear: false, text:props.value};
    }
    onChangeText(text){
        this.setState({text});
        if (this.props.onChangeText){
            this.props.onChangeText(text);
        }
    }

    componentWillReceiveProps(props){
        this.setState({text:props.value});
    }

    render(){
        var scale = this.props.scale;
        var width = this.props.width || dWidth/scale-this.props.x-10;
        var color = this.props.fill;
        if (color == 'none'){
            color = 'transparent';
        }
        if (this.props.editable){
            var {children, value, ...props} = this.props;
            return (
                <G scale={scale}>
                <React.TextInput
                    onFocus={()=>this.setState({showClear: true})}
                    onBlur={()=>this.setState({showClear: false})}
                     {...props}
                    style={[{
                       position:'absolute',
                       color,
                        left:this.props.x*scale,
                        width:width*scale-20,
                        height:this.props.fontSize*scale+10,
                        top:this.props.y*scale-this.props.fontSize*scale,
                        fontFamily:this.props.fontFamily,
                        fontSize:this.props.fontSize*scale,
                        fontWeight:this.props.fontWeight
                    },props.style]} placeholder={children}
                        value={this.state.text}
                        onChangeText={this.onChangeText.bind(this)}
                    />
                    {this.state.showClear ?  <ClearButton style={{position:'absolute',top:this.props.y*scale*0.5 - this.props.fontSize*scale*0.5 - 6 , left:(this.props.x*scale+width*scale)*0.5-10}} onPress={()=>this.onChangeText("")} /> : <View/>}

                    </G>
            );
        } else {
            return <React.Text {...this.props}
                style={[{
                    position:'absolute',
                    color,
                    top:this.props.y*scale-this.props.fontSize*scale,
                    left:this.props.x*scale,
                    fontSize: this.props.fontSize*scale,
                    fontFamily:this.props.fontFamily,
                    fontWeight:this.props.fontWeight
                    },this.props.style]} />
        }
    }
}

module.exports = {Use, Stop, Path, Defs, Mask, Polygon, LinearGradient, G, Ellipse, SvgDocument, Svg, Rect, Image, Text, Circle, ClearButton};
