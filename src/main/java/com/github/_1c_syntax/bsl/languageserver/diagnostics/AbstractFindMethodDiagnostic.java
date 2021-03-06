/*
 * This file is a part of BSL Language Server.
 *
 * Copyright © 2018-2020
 * Alexey Sosnoviy <labotamy@gmail.com>, Nikita Gryzlov <nixel2007@gmail.com> and contributors
 *
 * SPDX-License-Identifier: LGPL-3.0-or-later
 *
 * BSL Language Server is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * BSL Language Server is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with BSL Language Server.
 */
package com.github._1c_syntax.bsl.languageserver.diagnostics;

import com.github._1c_syntax.bsl.languageserver.diagnostics.metadata.DiagnosticInfo;
import com.github._1c_syntax.bsl.parser.BSLParser;
import lombok.Getter;
import lombok.Setter;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.regex.Pattern;

public abstract class AbstractFindMethodDiagnostic extends AbstractVisitorDiagnostic {

  @Getter
  @Setter
  private Pattern methodPattern;

  AbstractFindMethodDiagnostic(DiagnosticInfo info, Pattern pattern) {
    super(info);
    methodPattern = pattern;
  }

  protected boolean checkGlobalMethodCall(BSLParser.GlobalMethodCallContext ctx) {
    return getMethodPattern().matcher(ctx.methodName().getText()).matches();
  }

  protected boolean checkMethodCall(BSLParser.MethodCallContext ctx) {
    return getMethodPattern().matcher(ctx.methodName().getText()).matches();
  }

  @Override
  public ParseTree visitGlobalMethodCall(BSLParser.GlobalMethodCallContext ctx) {

    if (checkGlobalMethodCall(ctx)) {
      diagnosticStorage.addDiagnostic(ctx.methodName());
    }

    return super.visitGlobalMethodCall(ctx);
  }

  @Override
  public ParseTree visitMethodCall(BSLParser.MethodCallContext ctx) {

    if (checkMethodCall(ctx)) {
      diagnosticStorage.addDiagnostic(ctx.methodName());
    }

    return super.visitMethodCall(ctx);
  }
}
