# react-native-tableview
Native iOS UITableView for React Native.

## Why I need to use it?
- To display long lists of data and item selection (like country list) - built-in list view has performance issues for long lists
- To use built-in accessory types (checkmark or disclosure indicator)
- Automatic scroll to initial selected value during component initialization

## Supports UITableView styles
- UITableViewStylePlain (TableView.Consts.Style.Plain)
- UITableViewStyleGrouped (TableView.Consts.Style.Grouped)

## Supports UITableViewCell styles
- UITableViewCellStyleDefault (TableView.Consts.CellStyle.Default)
- UITableViewCellStyleValue1 (TableView.Consts.CellStyle.Value1)
- UITableViewCellStyleValue2 (TableView.Consts.CellStyle.Value2)
- UITableViewCellStyleSubtitle (TableView.Consts.CellStyle.Subtitle)

## Supports accessory types
- UITableViewCellAccessoryDisclosureIndicator ("arrow" attribute for TableView.Item or TableView.Section)
- UITableViewCellAccessoryCheckmark ("selected" attribute for TableView.Item)

## Example
'use strict';

var React = require('react-native');
var { AppRegistry } = React;
var TableView = require('react-native-tableview');
var Section = TableView.Section;
var Item = TableView.Item;

class TableViewExample extends React.Component {
    render(){
        return (
            <TableView style={{flex:1}}
                       tableViewStyle={TableView.Consts.Style.Grouped}
                       tableViewCellStyle={TableView.Consts.CellStyle.Subtitle}
                       onPress={(event) => console.log(event.nativeEvent)}>
                <Section label="Section 1" arrow={true}>
                    <Item value="1" detail="Detail1" >Item 1</Item>
                    <Item value="2">Item 2</Item>
                    <Item>Item 3</Item>
                    <Item>Item 4</Item>
                    <Item>Item 5</Item>
                    <Item>Item 6</Item>
                    <Item>Item 7</Item>
                    <Item>Item 8</Item>
                    <Item>Item 9</Item>
                    <Item>Item 10</Item>
                    <Item>Item 11</Item>
                    <Item>Item 12</Item>
                    <Item>Item 13</Item>
                    <Item>Item 14</Item>
                    <Item>Item 15</Item>
                    <Item>Item 16</Item>
                    <Item>Item 17</Item>
                    <Item>Item 18</Item>
                    <Item>Item 19</Item>
                    <Item>Item 20</Item>
                    <Item>Item 21</Item>
                    <Item>Item 22</Item>
                    <Item>Item 23</Item>
                    <Item>Item 24</Item>
                    <Item>Item 25</Item>
                    <Item>Item 26</Item>
                    <Item>Item 27</Item>
                    <Item>Item 28</Item>
                    <Item>Item 29</Item>
                    <Item>Item 30</Item>
                </Section>
                <Section label="Section 2" arrow={false}>
                    <Item selected={true}>Item 1</Item>
                    <Item>Item 2</Item>
                    <Item>Item 3</Item>
                </Section>
            </TableView>
        );
    }
}

AppRegistry.registerComponent('TableViewExample', () => TableViewExample);
```

## Getting started
1. `npm install react-native-tableview --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. add `./node_modules/react-native-tableview/RCTTableView.xcodeproj`
4. In the XCode project navigator, select your project, select the `Build Phases` tab and in the `Link Binary With Libraries` section add **libRCTTableView.a**
5. `var TableView = require('react-native-tableview')`

