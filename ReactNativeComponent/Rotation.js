/**
 * Created by lichengke on 2017/4/25.
 */
/**
 * Created by lichengke on 2017/4/12.
 */

'use strict';

import React,{Component} from 'react';
var Orientation = require('react-native-orientation');
var Dimensions = require('Dimensions');
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableOpacity,
} from 'react-native';

export default class Rotation extends Component {

    constructor(props) {
        super(props);
        this.state = { isLand: false };
    }


    _orientationDidChange(orientation) {
        if (orientation == 'LANDSCAPE') {
            //do something with landscape layout
            this.setState({isLand: true});
        } else {
            //do something with portrait layout
            this.setState({isLand: false});
        }

        console.log("_orientationDidChange: ", orientation);

    }

    componentWillMount() {
        //The getOrientation method is async. It happens sometimes that
        //you need the orientation at the moment the js starts running on device.
        //getInitialOrientation returns directly because its a constant set at the
        //beginning of the js code.
        var initial = Orientation.getInitialOrientation();

        console.log("Current Device Orientation: ", initial);

    }

    componentDidMount() {
        // Orientation.lockToPortrait(); //this will lock the view to Portrait
        //Orientation.lockToLandscape(); //this will lock the view to Landscape
        //Orientation.unlockAllOrientations(); //this will unlock the view to all Orientations

        Orientation.addOrientationListener(this._orientationDidChange.bind(this));
    }

    componentWillUnmount() {
        Orientation.getOrientation((err,orientation)=> {
            console.log("Current Device Orientation: ", orientation);
        });
        Orientation.removeOrientationListener(this._orientationDidChange);
    }

    render() {
        return (
            <View style={styles.container}>
                <Text style={{color:'white'}}>
                    Rotation页面
                </Text>
                <View style={this.state.isLand ? styles.boxLandStyle : styles.boxPortraitStyle}>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#01B468',
    },
    boxLandStyle:{
        backgroundColor:'red',
        width:100,
        height:100,
        position:'absolute',
        top:10,
        left:10
    },
    boxPortraitStyle:{
        backgroundColor:'green',
        width:50,
        height:50,
        position:'absolute',
        bottom:10,
        right:10
    }

});