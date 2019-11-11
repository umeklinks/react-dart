import 'dart:html';

import 'package:react/hooks.dart';
import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';

var useStateTestFunctionComponent = react.registerFunctionComponent(UseStateTestComponent, displayName: 'useStateTest');

UseStateTestComponent(Map props) {
  final count = useState(0);

  return react.div({}, [
    count.value,
    react.button({'onClick': (_) => count.set(0)}, ['Reset']),
    react.button({
      'onClick': (_) => count.setWithUpdater((prev) {
            if (props['enabled']) {
              return prev + 1;
            } else {
              return prev;
            }
          }),
    }, [
      '+'
    ]),
  ]);
}

void main() {
  setClientConfiguration();

  render() {
    react_dom.render(
        react.Fragment({}, [
          react.h1({'key': 'functionComponentTestLabel'}, ['Function Component Tests']),
          react.h2({'key': 'useStateTestLabel'}, ['useState Hook Test']),
          useStateTestFunctionComponent({
            'key': 'useStateTest',
            'enabled': true,
          }, []),
          react.br({}),
          react.h5({'key': 'useStateTestLabel-2'}, 'Disabled:'),
          useStateTestFunctionComponent({
            'key': 'useStateTest',
            'enabled': false,
          }, []),
        ]),
        querySelector('#content'));
  }

  render();
}
