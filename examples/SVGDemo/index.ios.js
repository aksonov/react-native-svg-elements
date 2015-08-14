'use strict';

var React = require('react-native');
var { AppRegistry,StatusBarIOS, View, Dimensions, ScrollView, Text, TouchableHighlight} = React;
var {Use, Path, Defs, Mask, LinearGradient,G,SvgDocument,Svg} = require('react-native-svg-elements');
var Wave = require('./Wave');
StatusBarIOS.setStyle("light-content", true)
class SvgExample extends React.Component {
    //componentWillMount(){
    //  this.setState({color:"#F61890", top:top});
    //
    //},
    //onLayout(event){
    //  var {x,y, width, height} = event.nativeEvent.layout;
    //  console.log(width*svgHeight);
    //  console.log(svgWidth*height);
    //  if (width*svgHeight!=svgWidth*height){
    //    var mheight = svgHeight * width/svgWidth;
    //    var top = (height - mheight);
    //   // this.setState({top:top});
    //    console.log(event.nativeEvent.layout);
    //  }
    //},
    //
    //
    render(){
        return <Wave/>;
    }
    render2() {
        // Switch between other demos below
        //transform:[{translateX:101*windowSize.width/1242},{translateY:333*windowSize.height/2208}]
        //101*windowSize.width/1242, left:333*windowSize.height/2208
        // return <Svg style={{height:dHeight, width:dWidth}} artworkPath="test"/>
        return (
            <Svg width={1242} height={2208} style={{position:'absolute',top:0,bottom:0,left:0,right:0}}>
                <G translateY={-51}>
                    <Defs>
                        <Path id="path-1" d="M0,0 L1242,0 L1242,1065 L614.867188,1138.01887 L0,1065 L0,0 Z"/>
                        <LinearGradient x1="50%" y1="0%" x2="50%" y2="100%" id="linearGradient-3" stop={["#C12C58,0%","#FF9016,100%"]}/>
                        <LinearGradient x1="50%" y1="0%" x2="50%" y2="100%" id="linearGradient-4" stop={["#D0118D,0%","#C30F0F,100%"]}/>

                    </Defs>
                    <Mask id="mask-2" fill="white">
                        <Use xlinkHref="#path-1"></Use>
                    </Mask>
                    <Use id="Rectangle-34" fill="#9A0053" xlinkHref="#path-1"></Use>
                    <Path d="M-6.671875,1067.30469 L1272.82026,18.6015625 L1268.98721,308.867722 C1265.46804,575.36514 1241.99995,1299.53125 1241.99995,1299.53125 L-158.251392,1108.35998 L-6.671875,1067.30469 Z" id="Path-20" fillOpacity="0.2" fill="url(#linearGradient-3)" mask="url(#mask-2)"></Path>
                    <Path d="M-37.2578136,8.19531209 L1118.85505,1243.35505 L-75.901807,1243.35505 L-75.901807,70.1355358" id="Path-21" fillOpacity="0.2" fill="url(#linearGradient-4)" mask="url(#mask-2)"></Path>

                    <G translateX={101} translateY={333}>
                        <Path d="M40,70.6308594 L0,0 L129,0 L129,130 L0,130 L40,70.6308594 Z" id="Rectangle-36" fill="#DF0971"></Path>
                        <Path d="M129.208252,130.20874 L120.090088,118.73584 L129.126709,117.417969" id="Path-18" fill="#D01160"></Path>
                        <Text>HELLO WORLD</Text>
                    </G>
                </G>
            </Svg>
        );
        //<Use style={{position:'absolute',top:-20,width:dWidth,height:dHeight}} id="Rectangle-34" fill="#9A0053" xlinkHref="#path-1"></Use>
        //<Path scale={scale} style={{position:'absolute',top:-20,width:dWidth,height:dHeight}} d="M-6.671875,1067.30469 L1272.82026,18.6015625 L1268.98721,308.867722 C1265.46804,575.36514 1241.99995,1299.53125 1241.99995,1299.53125 L-158.251392,1108.35998 L-6.671875,1067.30469 Z" id="Path-20" fillOpacity="0.2" fill="url(#linearGradient-3)"></Path>
        //  <Path scale={scale} style={{position:'absolute',top:-20,width:dWidth,height:dHeight}} d="M-37.2578136,8.19531209 L1118.85505,1243.35505 L-75.901807,1243.35505 L-75.901807,70.1355358" id="Path-21" fillOpacity="0.2" fill="url(#linearGradient-4)"></Path>
        //<Path scale={scale} style={{width:dWidth,height:dHeight}} d="M-6.671875,1067.30469 L1272.82026,18.6015625 L1268.98721,308.867722 C1265.46804,575.36514 1241.99995,1299.53125 1241.99995,1299.53125 L-158.251392,1108.35998 L-6.671875,1067.30469 Z" id="Path-20" fillOpacity="0.2" fill="url(#linearGradient-3)"></Path>
        //<Path scale={scale} style={{width:dWidth,height:dHeight}} d="M-37.2578136,8.19531209 L1118.85505,1243.35505 L-75.901807,1243.35505 L-75.901807,70.1355358" id="Path-21" fill-opacity="0.2" fill="url(#linearGradient-4)"></Path>
        //<Path scale={1} style={{borderColor:'black',width:200,height:200,borderWidth:1}} d="M40,70.6308594 L0,0 L129,0 L129,130 L0,130 L40,70.6308594 Z" id="Rectangle-36" fill="#DF0971" fillOpacity="0.2"/>
        //<Path scale={1} style={{borderColor:'black',width:200,height:200,borderWidth:1}} d="M40,70.6308594 L0,0 L129,0 L129,130 L0,130 L40,70.6308594 Z" id="Rectangle-361" fill="#DF0971" fillOpacity="0.2"/>
        // return <D3Chart />;
        // return <ReactLogo />;
        // return <Chart />;
        //<Path style={{height:dHeight, width:dWidth}} d="M-6.671875,1067.30469 L1272.82026,18.6015625 L1268.98721,308.867722 C1265.46804,575.36514 1241.99995,1299.53125 1241.99995,1299.53125 L-158.251392,1108.35998 L-6.671875,1067.30469 Z" id="Path-20" fillOpacity="0.2" fill="black"></Path>
        //<Path style={{height:dHeight, width:dWidth}} d="M-37.2578136,8.19531209 L1118.85505,1243.35505 L-75.901807,1243.35505 L-75.901807,70.1355358" id="Path-21" fillOpacity="0.2" fill="black"></Path>
    }
}

AppRegistry.registerComponent('SvgExample', () => SvgExample);
