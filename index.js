'use strict';

var React = require('react-native');

var {
    View, requireNativeComponent,
    PropTypes,
    Dimensions,
    Image,
    Text,
    TouchableOpacity
    } = React;

var windowSize = Dimensions.get('window');
var dHeight = windowSize.height;
var dWidth = windowSize.width;

class Use extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGUse style={{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}} ref="child" {...this.props} />;
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
        return <SVGPath ref="child" {...props} style={[{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}, this.props.style]}  />;
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
        var { width, height, ...props } = this.props;
        props._height = height;
        props._width = width;
        var scale = this.props.scale;
        return <SVGRect style={{position:'absolute',top:0,left:0,bottom:0,right:0, backgroundColor:'transparent'}} ref="child" {...props}/>;
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
    mask: PropTypes.string,
    scale: PropTypes.number,
};

var SVGRect = requireNativeComponent('RCTSvgRect', Rect);

class Circle extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGCircle style={{position:'absolute',top:0,left:0,bottom:0,right:0, backgroundColor:'transparent'}} ref="child" {...this.props}/>;
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

var SVGCircle = requireNativeComponent('RCTSvgCircle', Circle);

class Defs extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGDefs ref="child" style={{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}} {...this.props} />;
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
        return <SVGMask style={{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}} ref="child" {...this.props} />;
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

        return <SVGLinearGradient style={{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}} ref="child" stop={stop} {...this.props} />;
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

function generateChildren(props, scale){
    var i=0;
    var res=[];
    React.Children.forEach(props.children, function(el) {
        var id = el.props.id;
        var passProps = props.passProps || {};
        var customProps = passProps[id] || {};
        var elProps = el.props;
        // apply stroke, fill to children
        var {stroke, strokeWidth, fill, fillRule} = props;
        var map = {stroke, strokeWidth, fill, fillRule, key:i++, scale:scale, passProps: props.passProps, ...elProps, ...customProps};
        res.push(React.addons.cloneWithProps(el, map));
    });
    return res;
}

class G extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        var translateX = this.props.translateX || 0;
        var translateY = this.props.translateY || 0;
        var scale = this.props.scale;
        var children = generateChildren(this.props, scale);

        var { transform, ...props } = this.props;
        if (transform)
            props._transform = transform;

        var styles = {
            backgroundColor:'transparent',
            position:"absolute",
            top:scale*translateY,
            bottom:0,
            left:scale*translateX,
            right:0
        };
        if (this.props.onPress){
            console.log("TOUCHABLE "+this.props.id);
            return (
                <TouchableOpacity ref="child" style={styles} {...props} >
                    {children}
                </TouchableOpacity>
            );
        } else {
            return (
                <SVGG ref="child" style={styles} {...props}>
                    {children}
                </SVGG>
            );
        }
    }
}

G.propTypes = {
    _transform: PropTypes.string,
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    scale: PropTypes.number,
};

var SVGG = requireNativeComponent('RCTSvgG', G);


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
    constructor(props){
        super(props);
        this.state = {};
    }
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    onLayout(event){
        var {x, y, width, height} = event.nativeEvent.layout;
        // calculate scale for whole svg document here
        var svgWidth = this.props.width;
        var svgHeight = this.props.height;
        this.setState({scale : width/svgWidth});

        //console.log(`onLayout ${x}, ${y}, ${svgWidth}, ${svgHeight}, ${width}, ${height}`);
    }

    render() {
        // if scale is not calculated, no need to draw SVG, but only empty view (to call onLayout and calculate scale)
        if (!this.state.scale) {
            return (<View style={this.props.style} onLayout={this.onLayout.bind(this)}/>);
        }
        console.log("SCALE:"+this.state.scale);
        var children = generateChildren(this.props, this.state.scale);
        return (
            <View ref="child" style={{"position":"absolute","top":0,"bottom":0,"left":0,"right":0}} {...this.props}>
                {children}
            </View>
        );
    }
}

Svg.propTypes = {
    width: PropTypes.number,
    height: PropTypes.number
};

var SVG = requireNativeComponent('RCTSvg', Svg);

class SvgImage extends React.Component {
    render(){
        var scale = this.props.scale || 1;
        return <Image style={{"position":"absolute","top":this.props.y*scale, left:this.props.x*scale, width:this.props.width*scale, height: this.props.height*scale}} {...this.props}/>
    }
}

class SvgText extends React.Component {
    render(){
        var scale = this.props.scale;
        return <Text {...this.props} style={[{color:this.props.fill}, this.props.style, {position:"absolute",top:this.props.y*scale-this.props.style.fontSize*scale, left:this.props.x*scale, fontSize: this.props.style.fontSize*scale}]} />
    }
}



module.exports = {Use, Stop, Path, Defs, Mask, LinearGradient, G, SvgDocument, Svg, Rect, SvgImage, SvgText, Circle};
