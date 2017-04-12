'use strict';

import React , {Component}from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View
} from 'react-native';
import RedView from './ReactNativeComponent/RedView';
import GreenView from './ReactNativeComponent/GreenView';

/*
 * 所有的原生转入react-native的入口其实已经在内存中了
 *
 */

const Views = {
    redView : RedView,
    greenView : GreenView
};


class ReactNativeView extends Component{

    render() {
        const RootView = Views[this.props.page];
        return (
                <RootView ></RootView>
        );
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
    }
});

// 整体js模块的名称
AppRegistry.registerComponent('ReactNativeView', () => ReactNativeView);