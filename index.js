'use strict';

var React = require('react-native');

var {
    View, requireNativeComponent,
    PropTypes,
    Dimensions,
    } = React;

var windowSize = Dimensions.get('window');
var dHeight = windowSize.height;
var dWidth = windowSize.width;

class Use extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGUse ref="child" {...this.props} />;
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
        return <SVGPath ref="child" {...this.props} style={[{backgroundColor:'transparent'}, this.props.style]}  />;
    }
}

Path.propTypes = {
    fill: PropTypes.string,
    stroke: PropTypes.string,
    strokeWidth: PropTypes.string,
    strokeMiterLimit: PropTypes.string,
    d: PropTypes.string,
    id: PropTypes.string,
    fillOpacity: PropTypes.string,
    mask: PropTypes.string,
    scale: PropTypes.number,
};

var SVGPath = requireNativeComponent('RCTSvgPath', Path);

class Defs extends React.Component {
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        return <SVGDefs ref="child" {...this.props} />;
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
        return <SVGLinearGradient ref="child" {...this.props} />;
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
    setNativeProps(nativeProps) {
        this.refs.child.setNativeProps(nativeProps);
    }

    render() {
        var translateX = this.props.translateX || 0;
        var translateY = this.props.translateY || 0;
        var scale = this.props.scale;
        console.log(`G render(), scale ${scale}, ${translateX}, ${translateY}`);
        var i=0;
        var children = React.Children.map(this.props.children, el=>React.addons.cloneWithProps(el, {key:i++, scale:scale,style:{position: 'absolute', top: scale*translateY, backgroundColor: 'transparent', bottom: 0, left: scale*translateX, right: 0}}));

        return (
            <View ref="child" {...this.props}>
                {children}
            </View>
            );
//        return <View style={{backgroundColor:'transparent',flex:1, transform:[{translateX:scale*translateX},{translateY:translateY*scale-5}]}} ref="child" {...this.props} />;
        //return <SVGG ref="child" {...this.props} />;
    }
}

G.propTypes = {
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
        var i=0;
        var children = React.Children.map(this.props.children, el=>React.addons.cloneWithProps(el, {key:i++, scale:this.state.scale, style:{position:'absolute',top:0,backgroundColor:'transparent',bottom:0,left:0,right:0}}));
        return (
            <View ref="child" {...this.props}>
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

module.exports = {Use, Path, Defs, Mask, LinearGradient, G, SvgDocument, Svg};
