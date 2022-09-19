import React from 'react';
import { withComponentFeatures } from 'universal-dashboard';
import { useReadingTime } from "react-hook-reading-time";

const UDReadTime = props => {
  const {
    text,
    minutes,
    words,
    time,
  } = useReadingTime(props.text);

  return (
    <div style={{ border: props.border, padding: props.padding, ['text-align']: props.textAlign, ['border-radius']: props.borderRadius }} key={props.id}>
      <div style={{ display: props.displayRead, ['border-bottom']: props.borderBottom, ['font-size']: props.fontSize, ['font-style']: props.fontStyle, ['font-weight']: props.fontWeight}}>{minutes}&nbsp;{props.timeToRead}&nbsp;</div>
      <div style={{ display: props.displayWords, ['border-bottom']: props.borderBottom, ['font-size']: props.fontSize, ['font-style']: props.fontStyle, ['font-weight']: props.fontWeight}}>{words}&nbsp;{props.words}</div>
      <p></p>
      {props.text}
    </div>);
}

export default withComponentFeatures(UDReadTime)