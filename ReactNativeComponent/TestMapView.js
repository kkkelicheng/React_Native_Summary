/**
 * Created by lichengke on 2017/5/2.
 */


import React,{Component} from 'react';
var { requireNativeComponent, StyleSheet ,View } = require('react-native');

var MyMapView = requireNativeComponent('KLCMapView', null);

export default class TestMapView extends Component {

    changeRegionAction(info){
        console.log('changeRegionAction ..... \n' , info.nativeEvent);
        console.log('changeRegionAction ..... \n' , info.nativeEvent.region);
    }

    render() {

        var region = {
            latitude: 37.48,
            longitude: -122.16,
            latitudeDelta: 0.1,
            longitudeDelta: 0.1,
        };

        return (
            <View style={styles.container}>
                <MyMapView style={styles.mapStyle} pitchEnabled={false} scrollEnabled={true}
                           region={region} onRegionChange={this.changeRegionAction}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'red',
    },
    mapStyle: {
        width:200,
        height: 200,
    }
});