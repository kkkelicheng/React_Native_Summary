/**
 * Created by lichengke on 2017/4/12.
 */

'use strict';

import React,{Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableOpacity,
} from 'react-native';

export default class RedView extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={{color:'white'}}>
                    NativePushRN页面_redView
                </Text>
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