/**
 * Created by lichengke on 2017/4/12.
 */

'use strict';

import React,{Component} from 'react';
import { NativeModules } from 'react-native';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableOpacity,
} from 'react-native';

export default class RedView extends Component {

    controller = null;
    
    callNativePopController(){
        console.log('JS callNativePopController');
        this.controller.addEvent("pop",{"action":"pop"});
    }

    callNativePushController(){
        console.log('JS  callNativePushController');
        this.controller.addEvent("push",
            {
                        "action":"push",
                "ControllerName":"RNPushNativeController",
                       "content":"今天天气不错哦"
            }
        );
    }

    componentDidMount() {
        this.controller = NativeModules.ExportedRNController;
    }
    
    render() {
        return (
            <View style={styles.container}>
                <Text style={{color:'white'}}>
                    NativePushRN页面_redView
                </Text>
                <TouchableOpacity onPress={this.callNativePopController.bind(this)}>
                <Text style={{color:'white'}}>
                    点我pop
                </Text>
            </TouchableOpacity>
                <TouchableOpacity onPress={this.callNativePushController.bind(this)}>
                    <Text style={{color:'red' , marginTop:10}}>
                        点我push
                    </Text>
                </TouchableOpacity>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#BF0060',
    }
});